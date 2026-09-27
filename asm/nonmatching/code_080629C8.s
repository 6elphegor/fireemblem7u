	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxHurtmutEff00
NewEfxHurtmutEff00: @ 0x080629C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080629F4 @ =0x0201774C
	ldr r5, [r0]
	cmp r5, #0
	bne _08062A06
	ldr r0, _080629F8 @ =0x08BA42F4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	ldr r0, _080629FC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08062A00
	adds r0, r4, #0
	bl NewEfxHurtmutEff00OBJ
	b _08062A06
	.align 2, 0
_080629F4: .4byte 0x0201774C
_080629F8: .4byte 0x08BA42F4
_080629FC: .4byte 0x0203E02C
_08062A00:
	adds r0, r4, #0
	bl NewEfxHurtmutEff01OBJ
_08062A06:
	pop {r4, r5}
	pop {r0}
	bx r0
