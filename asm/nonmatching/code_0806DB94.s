	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DB94
sub_0806DB94: @ 0x0806DB94
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806DC0C @ =0x02022860
	adds r0, r0, r1
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806DC10 @ =0x08C9CE58
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC0C: .4byte 0x02022860
_0806DC10: .4byte 0x08C9CE58
