module files

pub enum FileType {
	json
	yaml
	toml
	xml
	unknown
}

pub fn detect_file_type(ext string) FileType {
	return match ext {
		'json' { FileType.json }
		'yaml', 'yml' { FileType.yaml }
		'toml' { FileType.toml }
		'xml' { FileType.xml }
		else { FileType.unknown }
	}
}

pub fn detect_file_type_from_extension(file_name string) FileType {
	ext := file_name.split('.').last().to_lower()
	return detect_file_type(ext)
}

pub fn detect_file_type_from_content(content string) FileType {
	trimmed := content.trim_space()
	if trimmed.starts_with('{') && trimmed.ends_with('}') {
		return FileType.json
	} else if (trimmed.contains(':') && trimmed.contains('\n'))
		|| (trimmed.contains('- ') && trimmed.contains('\n')) {
		return FileType.yaml
	} else if trimmed.contains('=') && trimmed.contains('\n') {
		return FileType.toml
	} else if trimmed.starts_with('<') && trimmed.ends_with('>') {
		return FileType.xml
	}
	return FileType.unknown
}
