	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMain_StartIntroFx
BmMain_StartIntroFx: @ 0x080154C4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080154F4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	bne _080154FC
	ldr r2, _080154F8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	b _08015502
	.align 2, 0
_080154F4: .4byte 0x0202BBF8
_080154F8: .4byte 0x03002870
_080154FC:
	ldr r0, _08015508 @ =0x08B93934
	bl Proc_StartBlocking
_08015502:
	pop {r0}
	bx r0
	.align 2, 0
_08015508: .4byte 0x08B93934
