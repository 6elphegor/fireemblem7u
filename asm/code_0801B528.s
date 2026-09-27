	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B528
sub_0801B528: @ 0x0801B528
	push {lr}
	ldr r2, _0801B554 @ =0x08CE4D28
	ldr r0, _0801B558 @ =0x08CE5378
	cmp r2, r0
	bne _0801B560
	ldr r0, _0801B55C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801B578
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStart
	b _0801B578
	.align 2, 0
_0801B554: .4byte 0x08CE4D28
_0801B558: .4byte 0x08CE5378
_0801B55C: .4byte 0x0202BBF8
_0801B560:
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	movs r2, #0
	bl StartBgmExt
_0801B578:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
