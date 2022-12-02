const { generateTemplateFiles } = require('generate-template-files');

generateTemplateFiles([
    {
        option: "Beginner: Counter applet",
        defaultCase: '(pascalCase)',
        entry: {
            folderPath: './tools/templates/applets-react/counter',
        },
        stringReplacers: [{ question: 'Corresponding service name', slot: '__service__', defaultCase: "(pascalCase)" }],
        output: {
            path: '/root/projects/__service__/ui',
            pathAndFileNameDefaultCase: '(pascalCase)',
        },
        onComplete: (data) => { console.log(`Success! \nTo get started.. \n \ncd ${data.output.path}`) }
    }
])
