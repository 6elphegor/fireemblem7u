	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxFlashHPBarRestorePal
EfxFlashHPBarRestorePal: @ 0x0804F2E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F328
	ldr r0, _0804F310 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F320
	ldr r0, _0804F314 @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0804F318 @ =0x081D95B0
	adds r0, r0, r1
	ldr r1, _0804F31C @ =0x02022BC0
	b _0804F340
	.align 2, 0
_0804F310: .4byte 0x0203E0B8
_0804F314: .4byte 0x0203E020
_0804F318: .4byte 0x081D95B0
_0804F31C: .4byte 0x02022BC0
_0804F320:
	ldr r0, _0804F324 @ =0x081D9730
	b _0804F33E
	.align 2, 0
_0804F324: .4byte 0x081D9730
_0804F328:
	ldr r0, _0804F348 @ =0x0203E0B8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F358
	ldr r0, _0804F34C @ =0x0203E020
	movs r1, #2
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0804F350 @ =0x081D95B0
	adds r0, r0, r1
_0804F33E:
	ldr r1, _0804F354 @ =0x02022BE0
_0804F340:
	movs r2, #0x10
	bl CpuSet
	b _0804F362
	.align 2, 0
_0804F348: .4byte 0x0203E0B8
_0804F34C: .4byte 0x0203E020
_0804F350: .4byte 0x081D95B0
_0804F354: .4byte 0x02022BE0
_0804F358:
	ldr r0, _0804F374 @ =0x081D9730
	ldr r1, _0804F378 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
_0804F362:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F374: .4byte 0x081D9730
_0804F378: .4byte 0x02022BE0
