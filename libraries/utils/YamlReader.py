import yaml
from robot.api.deco import keyword

class YamlReader:

    @keyword("Read YAML File")
    def read_yaml_file(self, path):
        with open(path, 'r', encoding='utf-8') as file:
            return yaml.safe_load(file)

