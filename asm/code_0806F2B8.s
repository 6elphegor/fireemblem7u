	.include "macro.inc"

	.syntax unified

	thumb_func_start InitManimHits
InitManimHits: @ 0x0806F2B8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetWeaponAnimActorCount
	ldr r1, _0806F308 @ =0x0203E0FC
	adds r2, r1, #0
	adds r1, #0x5e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _0806F308 @ =0x0203E0FC
	ldr r1, [r7, #8]
	str r1, [r0, #0x50]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetWeaponAnimManimSpecialScr
	ldr r1, _0806F308 @ =0x0203E0FC
	str r0, [r1, #0x54]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F308: .4byte 0x0203E0FC
