module.exports = ({ env }) => ({
    proxy: true,
    host: env('MY_URL'),
    // url: env('MY_URL'),
    app: {
        keys: env.array('APP_KEYS')
    },
})