	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncUnitDeploymentState
SyncUnitDeploymentState: @ 0x0800F164
	push {r4, r5, lr}
	movs r4, #1
	movs r5, #1
	rsbs r5, r5, #0
_0800F16C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800F1B2
	ldr r0, [r2]
	cmp r0, #0
	beq _0800F1B2
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800F1B2
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F19C
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
	b _0800F1B2
_0800F19C:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800F1B2
	adds r0, r2, #0
	bl sub_0800F1C0
_0800F1B2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800F16C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
