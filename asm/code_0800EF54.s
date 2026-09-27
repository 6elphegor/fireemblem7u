	.include "macro.inc"

	.syntax unified

	thumb_func_start StartGiveItem
StartGiveItem: @ 0x0800EF54
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r2, #7
	bhi _0800EF70
	ldr r0, _0800EF6C @ =0x08B91DC4
	adds r1, r2, #0
	bl Proc_Start
	b _0800EF78
	.align 2, 0
_0800EF6C: .4byte 0x08B91DC4
_0800EF70:
	ldr r0, _0800EF98 @ =0x08B91DC4
	adds r1, r2, #0
	bl Proc_StartBlocking
_0800EF78:
	str r5, [r0, #0x58]
	str r4, [r0, #0x54]
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _0800EF90
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_0800EF90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF98: .4byte 0x08B91DC4
