	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045C54
sub_08045C54: @ 0x08045C54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08045C88 @ =0x03001400
	ldr r6, _08045C8C @ =0x0203DC9C
	ldrb r1, [r6, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl ClearUi
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _08045CE0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08045C94
	ldr r0, _08045C90 @ =0x03001420
	ldr r0, [r0, #4]
	bl EndMu
	b _08045C9C
	.align 2, 0
_08045C88: .4byte 0x03001400
_08045C8C: .4byte 0x0203DC9C
_08045C90: .4byte 0x03001420
_08045C94:
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
_08045C9C:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	ldr r1, _08045CD8 @ =0x0203DC9C
	ldrb r0, [r1, #5]
	strb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _08045CDC @ =0x03001400
	ldrb r1, [r1, #5]
	adds r0, r1, r0
	ldrb r2, [r0]
	movs r0, #4
	movs r1, #0
	movs r3, #0
	bl sub_08044B98
	adds r0, r5, #0
	bl sub_08045784
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _08045D16
	.align 2, 0
_08045CD8: .4byte 0x0203DC9C
_08045CDC: .4byte 0x03001400
_08045CE0:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08045D0A
	adds r0, r4, #0
	bl StartMu
	ldr r1, _08045D1C @ =0x03001420
	str r0, [r1, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x34]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, _08045D20 @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r4, #0xc]
_08045D0A:
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	movs r0, #5
	movs r1, #0
	bl sub_08044B98
_08045D16:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045D1C: .4byte 0x03001420
_08045D20: .4byte 0xFFFFFDFF
