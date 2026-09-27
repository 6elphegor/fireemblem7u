	.include "macro.inc"

	.syntax unified

	thumb_func_start RegisterDataFill
RegisterDataFill: @ 0x080030FC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08003170 @ =0x02024C94
	ldr r0, [r1]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	ldr r1, _08003174 @ =0x02024C9C
	adds r0, r1, r0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #4]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r0, _08003170 @ =0x02024C94
	ldr r1, _08003170 @ =0x02024C94
	ldr r2, [r1, #4]
	ldr r1, [r7, #8]
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _08003170 @ =0x02024C94
	ldr r0, _08003170 @ =0x02024C94
	ldr r1, _08003170 @ =0x02024C94
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003170: .4byte 0x02024C94
_08003174: .4byte 0x02024C9C
