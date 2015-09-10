Meow TV
==============

Cats on your TV with tvOS

Why?
=================================

I decided to spend a day exploring tvOS, and this is what I came up with.

Things I learned
=================================

1) **Layered images are required for the app icon**, and consist of three images - top, middle, and bottom – creating a parallax effect. Small images are each 400 x 240.

https://developer.apple.com/tvos/human-interface-guidelines/icons-and-images/#app-icon

2) **There is the concept of a top shelf area**, a large banner area above app icons that displays content specific to your app when it is highlighted. This content can either be dynamically loaded content, or a single large static image (1920 pt x 720 pts. Dynamic content can be displayed in one of two styles - inline or grouped.

3) **UICollectionView, along with other standard UI interfaces, are fair game.** I put together a collection view identical to one I would usually make for an iOS app. However, you need to do a little bit of additional work to indicate to the user which cell currently has focus when scrolling. For my collection view, I enable adjustsImageWhenAncestorFocused for my cell's imageview, and reveal a label beneath the image on focus using -didUpdateFocusInContext:withAnimationCoordinator:

```
- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    [coordinator addCoordinatedAnimations:^{
        if (self.focused) {
            self.label.alpha = 1;
        } else {
            self.label.alpha = 0;
        }
    } completion:nil];
}
```

4) **UITabBarController's tab bar goes at the top.** It operates just like the bottom UITabBar we know and love, but just aligns along the top. You can assign tab bar images that appear to the left of each tab bar item title.

5) **There is no local storage. iCloud it up.** I'm pulling in all images on the fly via remote URLs. I believe you might be able to do some caching, but there are no guarantees your data will be available next session. It seems the suggested way to manage data is iCloud key-value store, or CloudKit.

6) **Updating dynamic top shelf content relies on notification.** If you're loading dynamic content items into the top shelf, once you've fetched updated content, you'll need post a *TVTopShelfItemsDidChangeNotification* to [NSNotificationCenter defaultCenter]. I haven't gotten to loading dynamic content yet, but looking forward to it!