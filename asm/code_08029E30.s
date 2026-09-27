	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitExpMultiplier
GetUnitExpMultiplier: @ 0x08029E30
	push {r4, lr}
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	bne _08029E4C
	b _08029E66
_08029E48:
	movs r0, #2
	b _08029E68
_08029E4C:
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #4
	ldr r1, _08029E70 @ =0x0203A4F0
_08029E54:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _08029E48
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	ble _08029E54
_08029E66:
	movs r0, #1
_08029E68:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029E70: .4byte 0x0203A4F0
