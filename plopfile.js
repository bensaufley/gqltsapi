module.exports = function(plop) {
  plop.setPartial('timestamp', () => new Date().getTime());
  plop.setGenerator('migration', {
    description: 'migration typescript file for db-migrate',
    prompts: [{
      type: 'input',
      name: 'name',
      message: 'what is the name of the migration',
    }],
    actions: [{
      type: 'add',
      path: 'src/db/migrations/0{{> timestamp}}-{{name}}.ts',
      templateFile: 'plop-templates/migration.hbs',
    }],
  });
}
