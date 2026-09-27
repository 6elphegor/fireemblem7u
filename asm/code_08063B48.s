	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxChillAnime
NewEfxChillAnime: @ 0x08063B48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	cmp r1, #0
	bne _08063B64
	ldr r6, _08063B5C @ =0x08BD5644
	ldr r4, _08063B60 @ =0x08BD5848
	b _08063B68
	.align 2, 0
_08063B5C: .4byte 0x08BD5644
_08063B60: .4byte 0x08BD5848
_08063B64:
	ldr r6, _08063BC0 @ =0x08BD5BFC
	ldr r4, _08063BC4 @ =0x08BD5FB0
_08063B68:
	ldr r0, _08063BC8 @ =0x08BA46E8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r6, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _08063BCC @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r5, #0x60]
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08063BD0
	movs r1, #0xe4
	lsls r1, r1, #7
	b _08063BD4
	.align 2, 0
_08063BC0: .4byte 0x08BD5BFC
_08063BC4: .4byte 0x08BD5FB0
_08063BC8: .4byte 0x08BA46E8
_08063BCC: .4byte 0x02000010
_08063BD0:
	movs r1, #0x93
	lsls r1, r1, #8
_08063BD4:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
