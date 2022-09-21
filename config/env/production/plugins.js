// module.exports = () => {
//     return {
//         ckeditor: true
//     }
// }

module.exports = ({ env }) => ({
    graphql: {
        enabled: true,
        config: {
            playgroundAlways: true,
            defaultLimit: 10,
            maxLimit: 20,
            apolloServer: {
                tracing: false,
                introspection: true,
            },
        }
    },
    upload: {
        config: {
            provider: 'aws-s3', // For community providers pass the full package name (e.g. provider: 'strapi-provider-upload-google-cloud-storage')
            providerOptions: {
                accessKeyId: env('AWS_ACCESS_KEY_ID'),
                secretAccessKey: env('AWS_ACCESS_SECRET'),
                region: env('AWS_REGION'),
                params: {
                    Bucket: env('AWS_BUCKET'),
                },
            },
        },
    }
});