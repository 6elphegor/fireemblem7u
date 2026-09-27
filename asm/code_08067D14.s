	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPlayHittedSFX
EfxPlayHittedSFX: @ 0x08067D14
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08067D38 @ =0x0000FFFF
	bl EfxPlayCriticalHittedSFX
	adds r0, r5, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08067D46
	cmp r0, #1
	bgt _08067D3C
	cmp r0, #0
	beq _08067D42
	b _08067D4C
	.align 2, 0
_08067D38: .4byte 0x0000FFFF
_08067D3C:
	cmp r0, #2
	beq _08067D4A
	b _08067D4C
_08067D42:
	movs r4, #0xd4
	b _08067D4C
_08067D46:
	movs r4, #0xd5
	b _08067D4C
_08067D4A:
	ldr r4, _08067D74 @ =0x000002CE
_08067D4C:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08067D6E
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08067D6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067D74: .4byte 0x000002CE
