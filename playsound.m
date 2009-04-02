#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	if(argc > 1){
		NSString *filename = [NSString stringWithCString:argv[1]];
		NSLog(@"Trying to play %@", filename);
		
		NSURL *url = [[NSURL alloc] initWithString:filename];
		
		NSSound *snd = [NSSound alloc];

		if(url)
			snd = [snd initWithContentsOfURL:url byReference:false];
		else
			snd = [snd initWithContentsOfFile:filename byReference:false];
		if(snd){
			NSLog(@"duration = %f", [snd duration]);
			[snd play];
			while([snd isPlaying]) sleep(1); //fulhack? jappjapp
			[snd release];
		}else
			NSLog(@"Failed to load sound %@", filename);
		
	} else {
		NSLog(@"You must specify file or URL");
	}
	
  [pool drain];
  return 0;
}
