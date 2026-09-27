	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxHurtmutEff00OBJ
NewEfxHurtmutEff00OBJ: @ 0x08062A18
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08062A50 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062A54 @ =0x08BA430C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08062A58 @ =0x08BA14DC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062A50: .4byte 0x0201774C
_08062A54: .4byte 0x08BA430C
_08062A58: .4byte 0x08BA14DC
