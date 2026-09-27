	.include "macro.inc"

	.syntax unified

	thumb_func_start StartStatusHealEffect
StartStatusHealEffect: @ 0x08032DD4
	push {lr}
	adds r2, r1, #0
	ldr r1, _08032DFC @ =0x03004690
	str r0, [r1]
	cmp r2, #0
	beq _08032E08
	ldr r0, _08032E00 @ =0x08B96B74
	adds r1, r2, #0
	bl Proc_StartBlocking
	ldr r0, _08032E04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08032E10
	movs r0, #0xaa
	bl m4aSongNumStart
	b _08032E10
	.align 2, 0
_08032DFC: .4byte 0x03004690
_08032E00: .4byte 0x08B96B74
_08032E04: .4byte 0x0202BBF8
_08032E08:
	ldr r0, _08032E14 @ =0x08B96B74
	movs r1, #3
	bl Proc_StartBlocking
_08032E10:
	pop {r0}
	bx r0
	.align 2, 0
_08032E14: .4byte 0x08B96B74
