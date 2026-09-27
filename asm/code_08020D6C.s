	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020D6C
sub_08020D6C: @ 0x08020D6C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r2, _08020E18 @ =0x06002000
	movs r1, #0
	ldr r4, _08020E1C @ =0x11111111
	movs r3, #0x1f
_08020D7C:
	movs r0, #7
_08020D7E:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bge _08020D7E
	adds r1, r1, r4
	subs r3, #1
	cmp r3, #0
	bge _08020D7C
	movs r3, #0
	ldr r0, _08020E20 @ =0x02022860
	adds r4, r0, #0
	adds r4, #0x40
_08020D96:
	lsls r0, r3, #1
	lsls r1, r3, #0xb
	lsls r2, r3, #6
	adds r1, r1, r2
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble _08020D96
	movs r4, #0
	bl EnablePalSync
	ldr r3, _08020E24 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _08020E28 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020E2C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _08020E30 @ =0x08B93CA4
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020E18: .4byte 0x06002000
_08020E1C: .4byte 0x11111111
_08020E20: .4byte 0x02022860
_08020E24: .4byte 0x03002870
_08020E28: .4byte 0x0000FFE0
_08020E2C: .4byte 0x0000E0FF
_08020E30: .4byte 0x08B93CA4
