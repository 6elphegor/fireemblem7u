	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxYushaSpinShieldOBJ
NewEfxYushaSpinShieldOBJ: @ 0x0806282C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _08062854 @ =0x08BA42C4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _08062860
	ldr r2, _08062858 @ =0x08BAD8F0
	ldr r3, _0806285C @ =0x08BAEB90
	b _08062864
	.align 2, 0
_08062854: .4byte 0x08BA42C4
_08062858: .4byte 0x08BAD8F0
_0806285C: .4byte 0x08BAEB90
_08062860:
	ldr r2, _08062890 @ =0x08BAFE60
	ldr r3, _08062894 @ =0x08BB1130
_08062864:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0
	strh r0, [r4, #8]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08062898
	movs r1, #0xe4
	lsls r1, r1, #7
	b _0806289C
	.align 2, 0
_08062890: .4byte 0x08BAFE60
_08062894: .4byte 0x08BB1130
_08062898:
	movs r1, #0x93
	lsls r1, r1, #8
_0806289C:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
