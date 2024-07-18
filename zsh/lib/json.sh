
# "jq pretty", i.e. pretty print/page JSON file.
jqp() {
    jq . --color-output "$@" | batcat
}

# Pretty-print a YAML file as JSON.
yaml_to_json() {
    cat <<-RUBY | ruby | jq .
        require 'yaml'
        require 'json'
        YAML.load_stream(File.read('$1')) do |document|
          puts document.to_json
        end
RUBY
}

# Pretty-print a JSON file as YAML.
json_to_yaml() {
    cat <<-RUBY | ruby | batcat --language yaml --decorations never
        require 'yaml'
        require 'json'
        puts JSON.load(File.read('$1')).to_yaml
RUBY
}
