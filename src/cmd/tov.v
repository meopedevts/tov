module cmd

import cli
import os
import files

pub struct TovCommand {
mut:
	app cli.Command
}

pub fn new_command() TovCommand {
	mut app := cli.Command{
		name:        'tov'
		description: 'Parse JSON/XML/YAML/TOMl files to V structs'
		usage:       '\n\n' + 'Examples:\n' + '  tov -f input.json -o output.v\n' +
			'  cat input.yaml | tov -o output.v\n'
		posix_mode:  true
		execute:     execute
		flags:       [
			cli.Flag{
				flag:        .string
				name:        'file'
				abbrev:      'f'
				description: 'Input file (if not provided, reads from stdin)'
				required:    false
			},
			cli.Flag{
				flag:        .string
				name:        'output'
				abbrev:      'o'
				description: 'Output file name (V struct will be written to this file)'
				required:    false
			},
			cli.Flag{
				flag:        .string
				name:        'type'
				abbrev:      't'
				description: 'File type (json, yaml, toml, xml). If not provided, it will be auto-detected based on file extension or content if possible.'
				required:    false
			},
		]
		args:        ['file']
	}

	return TovCommand{
		app: app
	}
}

pub fn (mut tov TovCommand) run(args []string) {
	tov.app.setup()
	tov.app.parse(args)
}

fn execute(c cli.Command) ! {
	file_name := c.flags.get_string('file')!

	file_content := if file_name != '' {
		os.read_file(file_name) or { return error('${err.msg} (os error ${err.code})') }
	} else {
		os.get_raw_lines_joined()
	}

	type_flag := c.flags.get_string('type')!
	file_type := if type_flag != '' {
		files.detect_file_type(type_flag)
	} else if file_name != '' {
		files.detect_file_type_from_extension(file_name)
	} else {
		files.detect_file_type_from_content(file_content)
	}

	if file_type == files.FileType.unknown {
		return error('invalid file format')
	}

	return
}
