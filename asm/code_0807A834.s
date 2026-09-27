	.include "macro.inc"

	.syntax unified

	thumb_func_start HideAllUnits
HideAllUnits: @ 0x0807A834
	push {r4, lr}
	movs r4, #1
_0807A838:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A85A
	ldr r0, [r2]
	cmp r0, #0
	beq _0807A85A
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A85A
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0807A85A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A838
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
