	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062714
sub_08062714: @ 0x08062714
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08062774 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062778 @ =0x08BA426C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806277C @ =0x081E9692
	str r0, [r5, #0x48]
	ldr r0, _08062780 @ =0x08BA4284
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08062784 @ =0x081F398C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08062788 @ =0x081F35C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0806278C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806279A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062790
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0806279A
	.align 2, 0
_08062774: .4byte 0x0201774C
_08062778: .4byte 0x08BA426C
_0806277C: .4byte 0x081E9692
_08062780: .4byte 0x08BA4284
_08062784: .4byte 0x081F398C
_08062788: .4byte 0x081F35C4
_0806278C: .4byte 0x0203E02C
_08062790:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0806279A:
	pop {r4, r5}
	pop {r0}
	bx r0
