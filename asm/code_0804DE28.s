	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxNoDmage
NewEfxNoDmage: @ 0x0804DE28
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0804DE74 @ =0x02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0804DE78 @ =0x08B9AC74
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	str r5, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxDamageMojiEffect
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804DED0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DE74: .4byte 0x02017728
_0804DE78: .4byte 0x08B9AC74
