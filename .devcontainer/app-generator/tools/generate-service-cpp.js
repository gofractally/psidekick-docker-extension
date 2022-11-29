const { generateTemplateFiles } = require('generate-template-files');

const templateRoot = './tools/templates/services-cpp';
const stringReplacers = [{ question: 'Name of service', slot: '__service__' }];
const defaultCase = '(pascalCase)';
const outputPath = '/root/projects/__service__';
const successMessage = 'Success!\n\nTo get started, run...\n';

generateTemplateFiles([
    {
        option: "Empty Project",
        defaultCase,
        entry: {
            folderPath: templateRoot + '/Empty',
        },
        stringReplacers,
        output: {
            path: outputPath,
            pathAndFileNameDefaultCase: defaultCase,
        },
        onComplete: (data) => { console.log(successMessage + `code ${data.output.path}\n`) }
    },
    {
        option: "Beginner Example: Calculator service",
        defaultCase,
        entry: {
            folderPath: templateRoot + '/Calculator',
        },
        stringReplacers,
        output: {
            path: outputPath,
            pathAndFileNameDefaultCase: defaultCase,
        },
        onComplete: (data) => { console.log(successMessage + `code ${data.output.path}\n`) }
    }
])
