	.include "macro.inc"

	.syntax unified

	thumb_func_start RescueUsability
RescueUsability: @ 0x080217B0
	push {lr}
	ldr r0, _080217DC @ =0x03004690
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080217E0
	movs r0, #0x81
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	bne _080217E0
	adds r0, r2, #0
	bl MakeRescueTargetList
	bl CountTargets
	cmp r0, #0
	beq _080217E0
	movs r0, #1
	b _080217E2
	.align 2, 0
_080217DC: .4byte 0x03004690
_080217E0:
	movs r0, #3
_080217E2:
	pop {r1}
	bx r1
	.align 2, 0
