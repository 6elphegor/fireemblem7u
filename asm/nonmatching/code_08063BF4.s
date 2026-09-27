	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxChillAnime_Loop
EfxChillAnime_Loop: @ 0x08063BF4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08063C60
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r6, #0x60]
	bl AnimDelete
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08063C68 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r5, _08063C6C @ =0x02000000
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_08063C60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063C68: .4byte 0x02000010
_08063C6C: .4byte 0x02000000
