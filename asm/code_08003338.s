	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncLoOam
SyncLoOam: @ 0x08003338
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08003348 @ =0x03000028
	ldrh r1, [r0, #0xa]
	cmp r1, #0
	bne _0800334C
	b _0800337A
	.align 2, 0
_08003348: .4byte 0x03000028
_0800334C:
	ldr r1, _08003380 @ =0x03000028
	ldr r0, [r1]
	ldr r2, _08003380 @ =0x03000028
	ldr r1, [r2, #4]
	ldr r2, _08003380 @ =0x03000028
	ldrh r3, [r2, #0xa]
	adds r2, r3, #0
	lsls r3, r2, #1
	lsls r4, r3, #0xb
	lsrs r2, r4, #0xb
	bl CpuFastSet
	ldr r1, _08003380 @ =0x03000028
	ldr r0, [r1]
	ldr r1, _08003380 @ =0x03000028
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	bl ClearOam_thm
	ldr r0, _08003384 @ =0x03002860
	ldr r1, _08003380 @ =0x03000028
	ldr r2, [r1]
	str r2, [r0]
_0800337A:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003380: .4byte 0x03000028
_08003384: .4byte 0x03002860
