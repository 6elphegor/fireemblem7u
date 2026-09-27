	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSoundRoomScreen
StartSoundRoomScreen: @ 0x080AC2AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AC2BC @ =0x08CE54E4
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080AC2BC: .4byte 0x08CE54E4
