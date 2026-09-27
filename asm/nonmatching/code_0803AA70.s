	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAiStaffFuncIndex
GetAiStaffFuncIndex: @ 0x0803AA70
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, _0803AA8C @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AA94
	b _0803AAC8
	.align 2, 0
_0803AA8C: .4byte 0x03004690
_0803AA90:
	adds r0, r5, #0
	b _0803AACC
_0803AA94:
	adds r0, r4, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _0803AAD4 @ =0x081D3B74
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803AAC8
	movs r3, #0
	adds r2, r4, #4
	adds r1, r4, #0
_0803AAAC:
	ldrh r0, [r1]
	cmp r6, r0
	bne _0803AAB8
	ldr r0, [r2]
	cmp r0, #0
	bne _0803AA90
_0803AAB8:
	adds r3, #8
	adds r2, #8
	adds r1, #8
	adds r5, #1
	adds r0, r3, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803AAAC
_0803AAC8:
	movs r0, #1
	rsbs r0, r0, #0
_0803AACC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803AAD4: .4byte 0x081D3B74
