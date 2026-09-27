	.include "macro.inc"

	.syntax unified

	thumb_func_start PoisonDamageDisplay_Next
PoisonDamageDisplay_Next: @ 0x08033014
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	bl ApplyHazardHealing
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, _08033080 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08033064
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033064
	bl RunWaitEvents
_08033064:
	ldr r0, _08033080 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08033078
	bl RefreshUnitSprites
_08033078:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033080: .4byte 0x0203A85C
