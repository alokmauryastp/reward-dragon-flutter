import 'package:flutter_state_management/screens/game_time_screen/binding/game_time_binding.dart';
import 'package:flutter_state_management/screens/play_game/binding/play_game_binding.dart';
import 'package:flutter_state_management/screens/team_challenge/team_challenge_screen.dart';
import 'package:flutter_state_management/screens/team_mood/binding/team_mood_binding.dart';
import 'package:flutter_state_management/screens/dashboard_screen/binding/dashboard_binding.dart';
import 'package:flutter_state_management/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter_state_management/screens/forgot_password/binding/forgot_password_binding.dart';
import 'package:flutter_state_management/screens/forgot_password/forgot_password.dart';
import 'package:flutter_state_management/screens/forgot_password/verify_otp.dart';
import 'package:flutter_state_management/screens/notification_screen/binding/notification_binding.dart';
import 'package:flutter_state_management/screens/game_time_screen/game_time_screen.dart';
import 'package:flutter_state_management/screens/leaderboard_screen/binding/leaderboard_binding.dart';
import 'package:flutter_state_management/screens/leaderboard_screen/leaderboard_screen.dart';
import 'package:flutter_state_management/screens/my_concern/binding/my_concern_binding.dart';
import 'package:flutter_state_management/screens/my_coupons/my_coupons_screen.dart';
import 'package:flutter_state_management/screens/my_profile/binding/my_profile_binding.dart';
import 'package:flutter_state_management/screens/my_profile/my_profile_screen.dart';
import 'package:flutter_state_management/screens/reward_screen/binding/reward_binding.dart';
import 'package:flutter_state_management/screens/signup_screen/binding/signup_binding.dart';
import 'package:flutter_state_management/screens/splash_screen/binding/splash_binding.dart';
import 'package:flutter_state_management/screens/splash_screen/splash_screen.dart';
import 'package:flutter_state_management/screens/user_home_screen/binding/user_home_binding.dart';
import 'package:flutter_state_management/screens/user_home_screen/user_home_screen.dart';
import 'package:flutter_state_management/screens/video_player/binding/video_player_binding.dart';
import 'package:flutter_state_management/screens/video_player/video_player_screen.dart';
import 'package:flutter_state_management/screens/wellbeing_screen/binding/wellbeing_binding.dart';
import 'package:flutter_state_management/screens/wellbeing_screen/wellbeing_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/executive_team/binding/executive_team_binding.dart';
import '../screens/executive_team/executive_team.dart';
import '../screens/google_sign_in/binding/sign_in_binding.dart';
import '../screens/google_sign_in/sign_in_screen.dart';
import '../screens/manager_wellbeing/binding/manager_wellbeing_binding.dart';
import '../screens/manager_wellbeing/manager_wellbeing_screen.dart';
import '../screens/my_campaign/binding.dart/my_campaign_binding.dart';
import '../screens/my_josh/binding/my_josh_binding.dart';
import '../screens/my_performance/binding/my_performance_binding.dart';
import '../screens/my_performance/my_performance_screen.dart';
import '../screens/my_team/binding/my_team_binding.dart';
import '../screens/my_team/my_team_screen.dart';
import '../screens/play_game/play_game_screen.dart';
import '../screens/team_challenge/binding/team_challenge_binding.dart';
import '../screens/team_list_screen/binding/team_list_binding.dart';
import '../screens/team_list_screen/team_list_screen.dart';
import '../screens/team_mood/team_mood_screen.dart';
import '../screens/login_screen/binding/login_binding.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/manager_Leaderboard/manager_leaderboard_binding/manager_leaderboard_binding.dart';
import '../screens/manager_Leaderboard/manager_leaderboard_screen.dart';
import '../screens/manager_home_screen/binding/manager_home_binding.dart';
import '../screens/manager_home_screen/manager_home_screen.dart';
import '../screens/my_account_screen/binding/my_account_binding.dart';
import '../screens/my_account_screen/my_account.dart';
import '../screens/my_challenge/binding/my_challenge_binding.dart';
import '../screens/my_challenge/my_challenge_screen.dart';
import '../screens/my_coupons/binding/my_coupon_binding.dart';
import '../screens/my_resources/binding/my_resource_binding.dart';
import '../screens/notification_screen/notifications.dart';
import '../screens/my_campaign/my_campaign_screen.dart';
import '../screens/my_concern/my_concern_screen.dart';
import '../screens/my_josh/my_josh_screen.dart';
import '../screens/my_resources/my_resource_screen.dart';
import '../screens/reward_screen/reward_screen.dart';
import '../screens/signup_screen/signup_screen.dart';
import '../screens/team_campaign/binding/team_campaign_binding.dart';
import '../screens/team_campaign/team_campaign_screen.dart';
import '../screens/team_performance/bindings/team_performance_binding.dart';
import '../screens/team_performance/team_performance_screen.dart';

class ApplicationPages {
  static const splashScreen = '/SplashScreen';
  static const loginScreen = '/LoginScreen';
  static const signupScreen = '/SignupScreen';
  static const forgotPassword = '/ForgotPassword';
  static const verifyOtp = '/VerifyOtp';
  static const dashboardScreen = '/DashboardScreen';
  static const userHomeScreen = '/UserHomeScreen';
  static const leaderboardScreen = '/LeaderboardScreen';
  static const notificationScreen = '/NotificationScreen';
  static const rewardScreen = '/RewardScreen';
  static const wellbeingScreen = '/Wellbeing';
  static const myAccountScreen = '/MyAccountScreen';
  static const myProfileScreen = '/MyProfileScreen';
  static const myConcernScreen = '/MyConcernScreen';
  static const myResourceScreen = '/MyResourceScreen';
  static const myCouponScreen = '/MyCouponsScreen';
  static const myGameTimeScreen = '/GameTimeScreen';
  static const myJoshScreen = '/MyJoshScreen';
  static const myChallengeScreen = '/MyChallengeScreen';
  static const myCampaignScreen = '/MyCampaignScreen';
  static const myPerformanceScreen = '/MyPerformanceScreen';
  static const managerHomeScreen = '/ManagerHomeScreen';
  static const managerLeaderboardScreen = '/LeaderboardManagerScreen';
  static const teamPerformanceScreen = '/TeamPerformanceScreen';
  static const teamCampaignScreen = '/TeamCampaignScreen';
  static const teamChallengeScreen = '/TeamChallengeScreen';
  static const teamMoodScreen = '/TeamMoodScreen';
  static const myTeamScreen = '/MyTeamScreen';
  static const managerWellbeingScreen = '/ManagerWellbeingScreen';
  static const videoPlayerScreen = '/VideoPlayerScreen';
  static const signInScreen = '/SignInScreen';
  static const playGameScreen = '/PlayGameScreen';
  static const executiveTeamScreen = '/ExecutiveTeamScreen';
  static const teamListScreen = '/TeamListScreen';

  static List<GetPage>? getApplicationPages() => [
        GetPage(
            name: splashScreen,
            page: () => const SplashScreen(),
            binding: SplashBinding()),
        GetPage(
            name: loginScreen,
            page: () => const LoginScreen(),
            binding: LoginBinding()),
        GetPage(
            name: signupScreen,
            page: () => const SignupScreen(),
            binding: SignupBinding()),
        GetPage(
            name: forgotPassword,
            page: () => const ForgotPassword(),
            binding: ForgotPasswordBinding()),
        GetPage(name: verifyOtp, page: () => const VerifyOtp()),
        GetPage(
            name: dashboardScreen,
            page: () => const DashboardScreen(),
            binding: DashboardBinding()),
        GetPage(
            name: rewardScreen,
            page: () => const RewardScreen(),
            binding: RewardBinding()),
        GetPage(
            name: userHomeScreen,
            page: () => const UserHomeScreen(),
            binding: UserHomeBinding()),
        GetPage(
            name: leaderboardScreen,
            page: () => const Leaderboard(),
            binding: LeaderboardBinding()),
        GetPage(
            name: wellbeingScreen,
            page: () => const Wellbeing(),
            binding: WellBeingBinding()),
        GetPage(
            name: notificationScreen,
            page: () => const Notifications(),
            binding: NotificationBinding()),
        GetPage(
            name: myAccountScreen,
            page: () => const MyAccountScreen(),
            binding: MyAccountBinding()),
        GetPage(
            name: myProfileScreen,
            page: () => const MyProfileScreen(),
            binding: MyProfileBinding()),
        GetPage(
            name: myConcernScreen,
            page: () => const MyConcernScreen(),
            binding: MyConcernBinding()),
        GetPage(
          name: myResourceScreen,
          page: (() => const MyResourceScreen()),
          binding: MyResourceBinding(),
        ),
        GetPage(
          name: myCouponScreen,
          page: (() => const MyCouponsScreen()),
          binding: MyCouponBinding(),
        ),
        GetPage(
          name: myGameTimeScreen,
          page: (() => const GameTimeScreen()),
          binding: GameTimeBinding(),
        ),
        GetPage(
          name: myJoshScreen,
          page: (() => const MyJoshScreen()),
          binding: MyJoshBinding(),
        ),
        GetPage(
          name: myChallengeScreen,
          page: (() => const MyChallengeScreen()),
          binding: MyChallengeBinding(),
        ),
        GetPage(
          name: myCampaignScreen,
          page: (() => const MyCampaignScreen()),
          binding: MyCampaignBinding(),
        ),
        GetPage(
          name: myPerformanceScreen,
          page: (() => const MyPerformanceScreen()),
          binding: MyPerformanceBinding(),
        ),
        GetPage(
          name: managerHomeScreen,
          page: (() => const ManagerHomeScreen()),
          binding: ManagerHomeBinding(),
        ),
        GetPage(
          name: managerLeaderboardScreen,
          page: (() => const LeaderboardManagerScreen()),
          binding: ManagerLeaderboardBinding(),
        ),
        GetPage(
          name: teamPerformanceScreen,
          page: (() => const TeamPerformanceScreen()),
          binding: TeamPerformanceBinding(),
        ),
        GetPage(
          name: teamCampaignScreen,
          page: (() => const TeamCampaignScreen()),
          binding: TeamCampaignBinding(),
        ),
        GetPage(
          name: teamChallengeScreen,
          page: (() => const TeamChallengeScreen()),
          binding: TeamChallengeBinding(),
        ),
        GetPage(
          name: teamMoodScreen,
          page: (() => const TeamMoodScreen()),
          binding: TeamMoodBinding(),
        ),
        GetPage(
          name: myTeamScreen,
          page: (() => const MyTeamScreen()),
          binding: MyTeamBinding(),
        ),
        GetPage(
          name: managerWellbeingScreen,
          page: (() => const ManagerWellbeingScreen()),
          binding: ManagerWellbeingBinding(),
        ),
        GetPage(
          name: videoPlayerScreen,
          page: (() => const VideoPlayerScreen()),
          binding: VideoPlayerBinding(),
        ),
        GetPage(
          name: signInScreen,
          page: (() => const SignInScreen()),
          binding: SignInBinding(),
        ),
        GetPage(
          name: playGameScreen,
          page: (() => const PlayGameScreen()),
          binding: PlayGameBinding(),
        ),
        GetPage(
          name: executiveTeamScreen,
          page: (() => const ExecutiveTeam()),
          binding: ExecutiveTeamBinding(),
        ),
        GetPage(
          name: teamListScreen,
          page: (() => const TeamListScreen()),
          binding: TeamListBinding(),
        ),
      ];
}
