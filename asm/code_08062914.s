	.include "macro.inc"

	.syntax unified

	thumb_func_start efxYushaSpinShieldOBJ_806CD7C
efxYushaSpinShieldOBJ_806CD7C: @ 0x08062914
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	ldrh r2, [r0, #0x10]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08062936
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08062936
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_08062936:
	pop {r0}
	bx r0
	.align 2, 0
