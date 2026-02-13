module main

import cmd
import os

fn main() {
	mut tov := cmd.new_command()
	tov.run(os.args)
}
