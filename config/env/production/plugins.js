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
    ckeditor: {
        enabled: true
    }
});