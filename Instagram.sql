-> Featurs of Instagram Reals
 * SignUp/LogIn
 * Reels ka CRUD
 * Post a reel
 * Comment on reels
 * Like a reel
 * Notification about reel
 * Like ,Delete , Update etc.
 * Follow

User ->
    * name
    * email
    * password
    * isPublic
    * saved reels
    * dob
    * userName
    * user image link

ReelS ->
   * R_Id(PK) 
   * U_Id(FK) {REFERENECE -> USER}
   * Video Link
   * Song Likes
   * Caption

Comment ->
    * R_Id(FK) {REFERENCE -> REELS}
    * U_Id(FK) {REFERENCE -> USER}
    * description
    * Comment_id (PK)

Indexing -> if we wright INDEX key on any column then searching QUERY on it becomes faster
    but it requires extra space.

FOLLOW ->
    * Senders_Id(FK) {Reference -> USER}
    * Receivers_Id(FK) {REFERENCE -> USER}
    * isPending
