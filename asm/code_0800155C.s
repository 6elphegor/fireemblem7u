	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyColorAddition_ClampMax
ApplyColorAddition_ClampMax: @ 0x0800155C
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	ldr r0, _0800157C @ =0x02022860
	str r0, [r7, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0xc]
_08001572:
	ldr r0, [r7, #0xc]
	ldr r1, _08001580 @ =0x000001FF
	cmp r0, r1
	ble _08001584
	b _0800161C
	.align 2, 0
_0800157C: .4byte 0x02022860
_08001580: .4byte 0x000001FF
_08001584:
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #5
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #0xa
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	cmp r0, #0x1f
	ble _080015D8
	movs r0, #0x1f
	str r0, [r7, #0x10]
_080015D8:
	ldr r0, [r7, #0x14]
	cmp r0, #0x1f
	ble _080015E2
	movs r0, #0x1f
	str r0, [r7, #0x14]
_080015E2:
	ldr r0, [r7, #0x18]
	cmp r0, #0x1f
	ble _080015EC
	movs r0, #0x1f
	str r0, [r7, #0x18]
_080015EC:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x18]
	adds r2, r1, #0
	lsls r1, r2, #0xa
	ldr r3, [r7, #0x14]
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #2
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08001572
_0800161C:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
