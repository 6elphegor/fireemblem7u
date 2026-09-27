	.include "macro.inc"

	.syntax unified

	thumb_func_start NewBattleForecast
NewBattleForecast: @ 0x080340FC
	push {r4, lr}
	ldr r0, _08034114 @ =0x0202BBF8
	adds r4, r0, #0
	adds r4, #0x42
	ldrb r1, [r4]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _08034118
	bl ResetTextFont
	b _08034158
	.align 2, 0
_08034114: .4byte 0x0202BBF8
_08034118:
	ldr r0, _0803413C @ =0x08B96D5C
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x33
	movs r0, #0
	strb r0, [r2]
	ldrb r4, [r4]
	lsls r0, r4, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08034140
	cmp r0, #1
	beq _08034146
	b _0803414C
	.align 2, 0
_0803413C: .4byte 0x08B96D5C
_08034140:
	adds r1, #0x32
	movs r0, #1
	b _0803414A
_08034146:
	adds r1, #0x32
	movs r0, #2
_0803414A:
	strb r0, [r1]
_0803414C:
	ldr r0, _08034160 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
_08034158:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034160: .4byte 0x0202E3E4
