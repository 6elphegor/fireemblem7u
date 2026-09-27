	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801E5C8
sub_0801E5C8: @ 0x0801E5C8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetCurrentBgmSong
	adds r4, r0, #0
	bl GetActiveMapSong
	cmp r4, r0
	beq _0801E5E0
	movs r0, #4
	bl FadeBgmOut
_0801E5E0:
	ldr r0, _0801E600 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801E5F2
	ldr r0, _0801E604 @ =0x00000393
	bl m4aSongNumStart
_0801E5F2:
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E600: .4byte 0x0202BBF8
_0801E604: .4byte 0x00000393
