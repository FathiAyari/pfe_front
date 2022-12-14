import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome',
          'en': 'English',
          'fr': 'French',
          'language': 'Language',
          "add_product_to_list": "Add to list",
          "add": "Add card",
          "store": "Store",
          "add_card_title": "Add a new loyalty card",
          "card_name": "Card name",
          "see_less": "Hide",
          "show_more": "Show more",
          "notifications": "Notifications",
          "my_cards": "My cards",
          "search_for_friends": "Find friends",
          "connections": "Connections",
          "welcome_back": "Welcome,back !",
          "my_saved_items": "My saved items",
          "cancel": "Cancel",
          "close": "Close",
          "my_card": "My card",
          "my_lists": "My lists",
          "yes": "Yes",
          "no": "No",
          "share": "Share",
          "delete": "Delete",
          "wanna_logout": "Are you sure you want to exit ?",
          "change_password": "Password",
          "change_email": "Email",
          "change_user_name": "User's data",
          "new_password_hint": "New password",
          "old_password_hint": "Old password",
          "confirm_password_hint": "Confirm password",
          "delete_friend": "Delete",
          "accept_friend": "Accept",
          "password_hint": "Password",
          "email": "Email",
          "create_account": "You don't have an account ?",
          "remember_me": "Remember me",
          "create_an_account": "Create an Account ?",
          "already_have_account": "Already have an account ?",
          "continue": "Continue",
          "forgot_password": "Forgot password?",
          "confirm_password": "Confirm Password",
          "price": "Price",
          "date": "Date",
          "scan_barcode": "Scan bar code",
          "first_name": "First Name",
          "last_name": "Last Name",
          "validate": "Verify",
          "reset": "Reset",
          "update": "Update",
          "create_new_password": "Create new password",
          "enter_password_to_create": "Enter password to create",
          "new_password": "New password",
          "login": "Login",
          "signup": "Sign up",
          "sign_in": "Sign in",
          "ignore": "Ignore",
          "phone_number": "Phone number",
          "sign_up_here": "Sign up here",
          "start_shopping": "Start shopping",
          "sign_up": "Sign up",
          "get_started": "Get started",
          "next": "Next",
          "required": "This field is required",
          "demo_gmail": "demo@gmail.com",
          "password_did_not_match": "Password does not matched",
          "mobile_number": "Mobile Number",
          "number_hint": "1234567890",
          "dark_mode": "Dark mode",
          "light_mode": "Light mode",
          "logout": "Logout",
          "want_logout": "Are you sure you want to Logout?",
          "want_exit": "Are you sure you want to exit?",
          "saved_items": "Saved items",
          "in_progress": "In progress",
          "done": "Done",
          "pending": "Pending",
          "my_friends_list": "My friends list",
          "friends_requests": "Friends requests",
          "search": "Search",
          "scan": "Scan",
          "sign_up_with": "Sign up with ",
          "sign_in_with": "Sign in with ",
          "scan_success": "Card has been created successfully",
          "finish": "Finish",
          "caption": "One Idea , more features",
          "onboarding_1": "Comparator is a mobile application helps clients to  compare products and  offer the cheapest price",
          "onboarding_2": 'Save your money with App Name now you can get any product with the cheapest price in supermarkets',
          "onboarding_3": 'Now you can share your wish lists with friends,family, cousins to make shopping easier ',
          "onboarding_4": 'Comparator the easiest way to  manage your products and you loyalty cards ',
          "onboarding_1_title": 'Welcome to Comparator',
          "delete_friend_alert": "Do you want to delete your friend?",
          "delete_friend_request": "Do you want to delete the request ?",
          "accept_friend_request": "Do you want to accept the request?",
          "received_report": "You have received a shopping report",
          "friend_request_received": "You have received a friend request",
          "request_sent": "The request was sent successfully",
          "add_card_failed": "Card already exists",
          "add_card_success": "Card added successfully",
          "card_deleted": "Card deleted successfully",
          "confirm_delete_card": "Do you want to delete the card?",
          "invalid_input": "Invalid input value",
          "invalid_credentials": "Invalid credentials",
          "sent_at": "Received at",
          "accepted": "Request accepted",
          "deleted": "Request deleted",
          "failed": "Error occurred",
          "deleted_friend": "Friend deleted",
          "name": "Name",
          "products": "Prdoucts",
        },
        'fr_FR': {
          'welcome': 'Bonjour',
          'en': 'Anglais',
          'fr': 'Fran??ais',
          'language': 'Langue',
          "add_product_to_list": "Ajouter ?? une liste",
          "see_less": "Reduire",
          "show_more": "Afficher plus",
          "my_card": "Ma carte",
          "notifications": "Notifications",
          "my_cards": "Mes cartes",
          "search_for_friends": "Rechercher",
          "connections": "Amis",
          "welcome_back": "Bienvenue !",
          "my_saved_items": "Mes articles sauvegard??s",
          "cancel": "Annuler",
          "close": "Fermer",
          "my_card": "Ma carte",
          "my_lists": "Mes listes",
          "yes": "Oui",
          "no": "Non",
          "share": "Partager",
          "delete": "Supprimer",
          "change_password": "Mot de passe",
          "change_email": "Email",
          "change_user_name": "Donn??es personnelles",
          "new_password_hint": "Nouveau mot de passe",
          "old_password_hint": "Mot de passe actuel",
          "confirm_password_hint": "Confirmer le mot de passe",
          "delete_friend": "Supprimer",
          "accept_friend": "Accepter",
          "password_hint": "Mot de passe",
          "email": "Email",
          "create_account": "Vous avez pas un compte ?",
          "already_have_account": "Vous avez d??j?? un compte ?",
          "create_an_account": "Create an Account ?",
          "continue": "Continuer",
          "forgot_password": "Mot de passe oubli???",
          "confirm_password": "Confirmer mot de passe",
          "price": "Prix",
          "date": "Date",
          "scan_barcode": "Ajouter code ?? barre",
          "first_name": "Nom",
          "last_name": "Pr??nom",
          "validate": "Verifier",
          "reset": "Restaurer",
          "update": "Mise ?? jour",
          "create_new_password": "Create new password",
          "enter_password_to_create": "Enter password to create",
          "new_password": "Nouveau mot de passe",
          "login": "Connectez",
          "sign_up": "Cre??r",
          "sign_in": "Connectez",
          "ignore": "Ignorer",
          "add_friend": "Ajouter un ami",
          "sign_up_here": "Cr??er un compte",
          "get_started": "Commencer",
          "start_shopping": "Commncer l'achat",
          "next": "Suivant",
          "required": "Ce champ est requis",
          "demo_gmail": "demo@gmail.com",
          "password_did_not_match": "Password does not matched",
          "phone_number": "Num??ero de t??l??phone",
          "number_hint": "1234567890",
          "dark_mode": "Mode sombre",
          "light_mode": "Mode clair",
          "logout": "Deconnexion",
          "want_logout": "Vous voulez vous deconnecter ?",
          "want_exit": "Vous voulez vraiment quitter ?",
          "saved_items": "Elements sauvegard??s",
          "in_progress": "En cours",
          "done": "Termin??",
          "pending": "En attente",
          "my_friends_list": "List des amis",
          "friends_requests": "Demandes d'amis",
          "search": "Rechercher",
          "scan": "Scanner",
          "scan_success": "Votre carte a ??t?? scann?? avec succ??s",
          "finish": "Terminer",
          "caption": "Une id??e , plus de fonctionnalit??s",
          "onboarding_1_title": 'Bienvenue ?? Comparator',
          "onboarding_1":
              "Comparator est une application mobile qui aide les clients ?? comparer les produits et ?? proposer le prix le moins cher",
          "onboarding_2":
              "??conomisez votre argent avec App Name maintenant, vous pouvez obtenir n'importe quel produit au prix le moins cher dans les supermarch??s",
          "onboarding_3":
              'Vous pouvez d??sormais partager vos listes de souhaits avec vos amis, votre famille et vos cousins pour faciliter vos achats',
          "onboarding_4": 'Comparator le moyen le plus simple de g??rer vos produits et vos cartes de fid??lit?? ',
          "sign_up_with": "Se connecter avec",
          "sign_in_with": "S'authentifier avec",
          "delete_friend_alert": "Voulez vous  supprimer votre ami ?",
          "delete_friend_request": "Voulez vous  supprimer la demande ?",
          "accept_friend_request": "Voulez vous  accepter la demande ?",
          "received_report": "Vous avez re??u un rapport de courses ",
          "friend_request_received": "Vous avez re??u une demande d'ami",
          "request_sent": "La demande a ??t?? envoy??e avec succ??s",
          "card_name": "Nom de la carte",
          "add": "Ajouter",
          "add_card_title": "Ajouter une carte",
          "store": "Magasin",
          "add_card_failed": "Carte d??j?? existante",
          "add_card_success": "Carte ajout??e avec succ??s",
          "card_deleted": "Carte supprim??e avec succ??s",
          "confirm_delete_card": "Voulez vous supprimer cette carte ?",
          "invalid_input": "Entr??e invalide",
          "invalid_credentials": "Identifiants invalides",
          "sent_at": "Recu le",
          "accepted": "demande accept??e",
          "deleted": "Demande supprim??e",
          "failed": "Erreur lors de traitement",
          "deleted_friend": "Ami supprim??",
          "name": "Nom",
          "products": "Produits",
        },
      };
}
