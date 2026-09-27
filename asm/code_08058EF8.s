	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058EF8
sub_08058EF8: @ 0x08058EF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x60]
	ldrh r2, [r4, #0x2c]
	adds r2, #1
	strh r2, [r4, #0x2c]
	lsls r1, r2, #0x10
	ldrh r5, [r4, #0x2e]
	lsls r0, r5, #0x10
	cmp r1, r0
	ble _08058F28
	ldr r1, _08058F24 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _08058FA8
	.align 2, 0
_08058F24: .4byte 0x0201774C
_08058F28:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _08058F6C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058F44
	ldr r0, _08058F40 @ =0x08BB9288
	b _08058F46
	.align 2, 0
_08058F40: .4byte 0x08BB9288
_08058F44:
	ldr r0, _08058F68 @ =0x08BB9290
_08058F46:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x34]
	adds r0, r1, r2
	strh r0, [r4, #0x32]
	ldrh r5, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r1, r5, r2
	strh r1, [r4, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3a]
	b _08058FA4
	.align 2, 0
_08058F68: .4byte 0x08BB9290
_08058F6C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058F80
	ldr r0, _08058F7C @ =0x08BB9288
	b _08058F82
	.align 2, 0
_08058F7C: .4byte 0x08BB9288
_08058F80:
	ldr r0, _08058FB0 @ =0x08BB9290
_08058F82:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r5, [r4, #0x3e]
	ldrh r1, [r4, #0x38]
	adds r0, r5, r1
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r4, #0x3e]
	ldrh r2, [r4, #0x36]
	lsrs r0, r2, #8
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3e]
_08058FA4:
	lsrs r0, r4, #8
	strh r0, [r3, #4]
_08058FA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058FB0: .4byte 0x08BB9290
