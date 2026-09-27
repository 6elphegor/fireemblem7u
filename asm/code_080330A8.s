	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080330A8
sub_080330A8: @ 0x080330A8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r7, r0, #0
	ldr r4, _080330F0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1c
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	cmp r5, #4
	bgt _080330EA
	cmp r5, #1
	blt _080330EA
	movs r0, #2
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatusHealEffect
_080330EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080330F0: .4byte 0x0203A85C
