	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonFlameImpact_Loop
DragonFlameImpact_Loop: @ 0x0807EAE0
	push {r4, r5, lr}
	ldr r2, _0807EB1C @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	ldr r5, [r0, #0x2c]
	subs r5, r5, r1
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	ldr r4, [r0, #0x30]
	subs r4, r4, r1
	adds r4, #8
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	ldrh r2, [r0]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x42
	bl sub_08026250
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB1C: .4byte 0x0202BBB8
