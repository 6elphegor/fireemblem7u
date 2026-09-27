	.include "macro.inc"

	.syntax unified

	thumb_func_start InitOam
InitOam: @ 0x0800322C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080032BC @ =0x03000028
	ldr r1, _080032C0 @ =0x03002930
	str r1, [r0]
	ldr r0, _080032BC @ =0x03000028
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r0, _080032BC @ =0x03000028
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, _080032BC @ =0x03000028
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _080032C4 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldr r2, _080032C0 @ =0x03002930
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, _080032C4 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	movs r3, #0xe0
	lsls r3, r3, #0x13
	adds r2, r1, r3
	str r2, [r0, #4]
	ldr r0, _080032C4 @ =0x03000018
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r0, _080032C4 @ =0x03000018
	ldr r2, [r7]
	adds r1, r2, #0
	movs r2, #0x80
	subs r1, r2, r1
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080032BC: .4byte 0x03000028
_080032C0: .4byte 0x03002930
_080032C4: .4byte 0x03000018
