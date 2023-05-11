const baseUrl = 'http://api.reward-dragon.com:8000/';
// const baseUrl = 'http://45.64.156.214:8089/';
// const baseUrl = 'http://demoserver.aaratechnologies.in:8000/';
const productVoucherList = '${baseUrl}dragonadmin/product-voucher-lists/';
const alreadyLogin = '${baseUrl}accounts/show-msg-already-login/';
const loginUrl = '${baseUrl}accounts/login/';
const logoutUrl = '${baseUrl}accounts/logout/';
const sendOtpUrl = '${baseUrl}accounts/send-otp/';
const verifyOtpUrl = '${baseUrl}accounts/reset-password/';
const teamListForSignUp = '${baseUrl}managers/team-profile-list/';
const baseLocation = '${baseUrl}dragonadmin/org-baselocation-list-data/';
const signupUrl = '${baseUrl}accounts/signup/';
const notificationUrl = '${baseUrl}customers/notification-lists/';
const markReadNotificationUrl = '${baseUrl}customers/mark-read-notifications/';
const markUnReadNotificationUrl = '${baseUrl}customers/mark-unread-notifications/';
const deleteNotificationUrl = '${baseUrl}customers/delete-notifications/';
const userLoginCheck = '${baseUrl}accounts/user-login-check/';
const kpiMetAndWipUrl = '${baseUrl}customers/kpi-met-and-wip/';
const winLevelPointsUrl = '${baseUrl}customers/win-level-points/';
const rewardPointsUrl = '${baseUrl}customers/reward-points/';
const wellbeingListUrl = '${baseUrl}customers/wellbeing-lists/';
const homepageVoucherListUrl =    '${baseUrl}dragonadmin/ten-product-voucher-lists/';
const motivationalMessageUrl =    '${baseUrl}customers/user-motivational-message-list/';
const learningMaterialUrl = '${baseUrl}dragonadmin/learningmaterial-list-data/';
const updateProfileUrl = '${baseUrl}accounts/user-profile-update/';
const getCampaignListUrl = '${baseUrl}managers/review-campaign/';
const createCampaignUrl = '${baseUrl}managers/create-campaign/';
const endCampaignByManagerUrl = '${baseUrl}managers/end-campaign/';
const industryListDataUrl = '${baseUrl}managers/industry-list-data/';
const teamLeaderboardFilterUrl = '${baseUrl}managers/team-leaderboard-filter/';
const executiveLeaderboardFilterUrl = '${baseUrl}managers/executive-team-leaderboard-filter/';
const customerRewardResourcesUrl = '${baseUrl}customers/customer-reward-resources/';
const managerRewardResourcesUrl = '${baseUrl}managers/manager-reward-resources/';
const executiveRewardResourcesUrl = '${baseUrl}managers/executive-manager-reward-resources/';
const companySiteDataUrl = '${baseUrl}dragonadmin/companysite-list-data/';
const otherLinkDataUrl = '${baseUrl}dragonadmin/otherlink-list-data/';
const productVoucherWishListUrl = '${baseUrl}dragonadmin/product-voucher-wishlists/';
const concernCategoryListUrl = '${baseUrl}customers/concern-category-list/';
const customerConcernListUrl = '${baseUrl}customers/customer-concern-data-list/';
const submitUserConcernUrl = '${baseUrl}customers/customer-concern-data-update/';
const concernCategoryForManagerUrl = '${baseUrl}managers/manager-concern-category/';
const concernListForManagerUrl = '${baseUrl}managers/manager_raise_concern_list/';
const submitManagerConcernUrl = '${baseUrl}managers/manager_raise_concern_update/';
const myChallengeListUrl = '${baseUrl}customers/challenge-lists/';
const gameCategoryListUrl = '${baseUrl}dragonadmin/game-category-lists/';
const gameListUrl = '${baseUrl}dragonadmin/game-name-list/';
const managerKpiMetAndWipUrl = '${baseUrl}managers/manager-kpi-met-and-wip/';
const campaignPurposeListUrl = '${baseUrl}managers/campaign-purpose-list/';
const kpiListUrl = '${baseUrl}managers/kpiname-list-data/';
const teamMoodTodayUrl = '${baseUrl}managers/team-mood-today/';
const executiveTeamMoodTodayUrl = '${baseUrl}managers/team-mood-for-executive/';
const reasonPieChartDataUrl = '${baseUrl}managers/team-josh-reason-pie-chart-lists/';
const executiveReasonPieChartDataUrl = '${baseUrl}managers/executive_team_josh_reason_pie_chart/';
const managerJoshReasonTodayUrl = '${baseUrl}managers/manager_josh_reason_today/';
const executiveJoshReasonTodayUrl = '${baseUrl}managers/executive-manager-josh-reason/';
const customerJoshReasonTodayUrl = '${baseUrl}customers/customer-josh-reason-today/';
const acceptChallengeUrl = '${baseUrl}customers/accept-challenge/';
const getChallengeListUrl = '${baseUrl}managers/review-challenge/';
const getChallengePurposeListUrl = '${baseUrl}managers/challenge-purpose-list/';
const createChallengeUrl = '${baseUrl}managers/create-challenge/';
const endChallengeByManagerUrl = '${baseUrl}managers/end-challenge/';
const kpiPerformanceListUrl = '${baseUrl}customers/kpi-performance-lists/';
const myCampaignListUrl = '${baseUrl}customers/campaign-lists/';
const joshReasonTypeUrl = '${baseUrl}customers/customer-josh-reason-type/';
const joshReasonTypeForManagerUrl = '${baseUrl}managers/manager_josh_reason_type/';
const submitCustomerJoshUrl = '${baseUrl}customers/customer-josh-reason-create/';
const submitManagerJoshUrl = '${baseUrl}managers/manager-josh-reason-create/';
const healthAndFitnessDataUrl = '${baseUrl}dragonadmin/leadership-list-data/';
const inspiredLivingDataUrl = '${baseUrl}dragonadmin/finance-and-art-lists/';
const habitOfTheDayUrl = '${baseUrl}customers/habbit-of-the-day-message/';
const updateStepTakenUrl = '${baseUrl}customers/save-steps-taken/';
const avtarImageListUrl = '${baseUrl}dragonadmin/avatar-image-lists/';
const updateAvtarImageUrl = '${baseUrl}accounts/update-avatar-image/';
const managerTeamListUrl = '${baseUrl}managers/team-lists/';
const managerKpiListUrl = '${baseUrl}managers/kpi-lists/';
const teamEmployeeListUrl = '${baseUrl}managers/team-employee-lists/';
const teamPerformanceListUrl = '${baseUrl}managers/team-performance-lists/';
const challengePointDataUrl = '${baseUrl}customers/challenge-point-data/';
const nextAvailabilityTimeUrl = '${baseUrl}customers/customer-played-game-list/';
const gamePointUrl = '${baseUrl}customers/game-point-list/';
const skillHobbyListUrl = '${baseUrl}dragonadmin/skill-and-hobby-list/';
const teamWellbeingListUrl = '${baseUrl}managers/team-wellbeing-lists/';
const teamWellbeingTopThreeListUrl = '${baseUrl}managers/team-wellbeing-top-three-lists/';
const convertPointToMoneyUrl = '${baseUrl}customers/convert-points-to-money/';
const updatePlayedGameTimeUrl = '${baseUrl}customers/customer-played-game-time/';
const teamPointDataUrl = '${baseUrl}customers/employee-list/';
const watchTimeDataUrl = '${baseUrl}customers/watch-time-data/'; //health & fitness
const skillHobbyTimeDataUrl = '${baseUrl}customers/read-skill-and-hobby-time-data/';
const learningMaterialTimeDataUrl = '${baseUrl}customers/learning-material-time-data/';
const addToWishlistUrl = '${baseUrl}dragonadmin/add-to-wishlist/';
const removeWishlistUrl = '${baseUrl}dragonadmin/remove-from-wishlist/';
const listMyCouponUrl = '${baseUrl}customers/list-my-coupon/';
const uploadProfileImageUrl = '${baseUrl}accounts/update-user-image/';
const getGetLeadershipTalkListDataUrl = '${baseUrl}dragonadmin/leader-ship-talk-list/';
const inspiredLivingTimeUpdateUrl = '${baseUrl}customers/finance-and-art-data/';
const claimRewardUrl = '${baseUrl}customers/save-my-coupon/';
const sendCampaignToWhatsappUrl = '${baseUrl}managers/send-created-campaign-on-whatsapp/';
const sendChallengeToWhatsappUrl = '${baseUrl}managers/send-created-challenge-on-whatsapp/';
const updateHeartPointsUrl = '${baseUrl}customers/save-heart-points/';
const teamListForRewardResourceUrl = '${baseUrl}managers/team-list-manager/';
const executiveListUrl = '${baseUrl}dragonadmin/org-user-profile-list/';
const teamEmployeeListForExecutiveUrl = '${baseUrl}managers/team-employee-data-list/';

// Google Fit API

const getHeartPointFromGoogleFIt = 'https://www.googleapis.com/fitness/v1/users/me/dataset:aggregate';

// Vouchik Api

const giftCategoryListUrl = 'https://dashboard.jamdj.one/api/categories';
const giftBrandListUrl = 'https://dashboard.jamdj.one/api/brands';

// Privacy Policy Link

const privacyPolicyUrl ='https://reward-dragon.com/privacy-policy.html';

const termConditionUrl = '${baseUrl}dragonadmin/terms/';