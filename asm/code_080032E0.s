	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncHiOam
SyncHiOam: @ 0x080032E0
	push {r4, r7, lr}
	mov r7, sp
	ldr r1, _08003324 @ =0x03000018
	ldr r0, [r1]
	ldr r2, _08003324 @ =0x03000018
	ldr r1, [r2, #4]
	ldr r2, _08003324 @ =0x03000018
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _08003324 @ =0x03000018
	ldr r0, [r1]
	ldr r1, _08003324 @ =0x03000018
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl ClearOam_thm
	ldr r0, _08003328 @ =0x03002F34
	ldr r1, _08003324 @ =0x03000018
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, _0800332C @ =0x03003948
	ldr r1, _08003330 @ =0x03002930
	str r1, [r0]
	ldr r0, _08003334 @ =0x0300291C
	movs r1, #0
	strh r1, [r0]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003324: .4byte 0x03000018
_08003328: .4byte 0x03002F34
_0800332C: .4byte 0x03003948
_08003330: .4byte 0x03002930
_08003334: .4byte 0x0300291C
