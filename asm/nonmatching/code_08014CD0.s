	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014CD0
sub_08014CD0: @ 0x08014CD0
	push {r4, r5, lr}
	ldr r4, _08014D54 @ =0x03002870
	movs r5, #0x80
	adds r0, r5, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08014CF4
	movs r0, #0
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014CF4:
	adds r0, r5, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	cmp r0, #0
	bne _08014D12
	movs r0, #1
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014D12:
	adds r0, r5, #0
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08014D30
	movs r0, #2
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014D30:
	adds r0, r5, #0
	ldrb r4, [r4, #0x18]
	ands r0, r4
	cmp r0, #0
	bne _08014D4E
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014D4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014D54: .4byte 0x03002870
