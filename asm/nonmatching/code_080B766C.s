	.include "macro.inc"

	.syntax unified

	thumb_func_start EpilogueText_LoopFadeOut
EpilogueText_LoopFadeOut: @ 0x080B766C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	ldr r0, _080B76B4 @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r3, r2, #0x11
	movs r0, #0x10
	subs r0, r0, r3
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x20
	bne _080B76AC
	adds r0, r5, #0
	bl Proc_Break
_080B76AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B76B4: .4byte 0x03002870
