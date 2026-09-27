	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxLokmsuna
NewEfxLokmsuna: @ 0x0806301C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08063040 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _0806303A
	ldr r0, _08063044 @ =0x08BA4434
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	bl NewEfxLokmsunaOBJ
_0806303A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063040: .4byte 0x0201774C
_08063044: .4byte 0x08BA4434
