	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxFlashFXMain
EfxFlashFXMain: @ 0x080631B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080631CE
	adds r0, r6, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	b _08063204
_080631CE:
	cmp r0, #6
	bne _08063204
	ldr r5, _0806320C @ =0x02000000
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
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
	adds r0, r7, #0
	bl Proc_Break
_08063204:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806320C: .4byte 0x02000000
