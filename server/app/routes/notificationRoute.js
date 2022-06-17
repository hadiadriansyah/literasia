module.exports = (app) => {
    const notification = require('../controllers/notificationController')
    const router = require('express').Router()

    router.get('/', notification.check)

    app.use('/api/notification', router)
}